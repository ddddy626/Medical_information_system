/**
 * 医生端「待回复咨询」聚合：按患者判断最后一轮是否仍待医生回复。
 */
(function (global) {
    const isHumanChatRow = (c) =>
        c &&
        c.consultType === 1 &&
        c.content &&
        String(c.content).trim() &&
        !String(c.content).startsWith('【AI咨询对话记录】');

    const roleOf = (c) => {
        const r = c.senderRole;
        if (r === 0 || r === 1 || r === '0' || r === '1') return Number(r);
        return null;
    };

    const rowsForPatient = (patientId, allConsults) =>
        (allConsults || []).filter((c) => c.patientId === patientId && isHumanChatRow(c));

    const lastDoctorActivityId = (rows) => {
        let maxId = 0;
        rows.forEach((c) => {
            if (roleOf(c) === 1) maxId = Math.max(maxId, c.consultId || 0);
            if (c.reply && String(c.reply).trim()) maxId = Math.max(maxId, c.consultId || 0);
        });
        return maxId;
    };

    const lastPatientMessageId = (rows) => {
        let maxId = 0;
        rows.forEach((c) => {
            if (roleOf(c) === 0) maxId = Math.max(maxId, c.consultId || 0);
        });
        return maxId;
    };

    const patientHasPendingReply = (patientId, allConsults) => {
        const rows = rowsForPatient(patientId, allConsults);
        if (!rows.length) return false;

        const lastPatient = lastPatientMessageId(rows);
        if (lastPatient === 0) {
            const legacy = rows.find((c) => roleOf(c) == null);
            if (!legacy) return false;
            return !(legacy.reply && String(legacy.reply).trim());
        }

        const lastDoctor = lastDoctorActivityId(rows);
        return lastPatient > lastDoctor;
    };

    const getLastPatientPreview = (patientId, allConsults) => {
        const rows = rowsForPatient(patientId, allConsults)
            .filter((c) => roleOf(c) === 0)
            .sort((a, b) => (a.consultId || 0) - (b.consultId || 0));
        if (rows.length) return rows[rows.length - 1].content || '';
        const legacy = rowsForPatient(patientId, allConsults).find((c) => roleOf(c) == null);
        return legacy ? legacy.content || '' : '';
    };

    const getPendingPatientItems = (allConsults) => {
        const byPatient = {};
        (allConsults || []).forEach((c) => {
            if (!isHumanChatRow(c) || !c.patientId) return;
            const key = c.patientId;
            if (!byPatient[key] || (c.consultId || 0) > (byPatient[key].consultId || 0)) {
                byPatient[key] = { ...c, patientId: key };
            }
        });

        return Object.values(byPatient)
            .filter((item) => patientHasPendingReply(item.patientId, allConsults))
            .map((item) => ({
                ...item,
                _preview: getLastPatientPreview(item.patientId, allConsults),
                _hasNew: true
            }))
            .sort((a, b) => (b.consultId || 0) - (a.consultId || 0));
    };

    global.ConsultPending = {
        isHumanChatRow,
        patientHasPendingReply,
        getLastPatientPreview,
        getPendingPatientItems
    };
})(window);
