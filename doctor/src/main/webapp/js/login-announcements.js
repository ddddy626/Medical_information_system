/**
 * 登录后系统公告弹窗（医生/患者跳转工作台后展示，管理员在 index 页展示）
 */
(function (global) {
    const FLAG_KEY = 'showLoginAnnouncements';

    const escapeHtml = (s) => String(s || '')
        .replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;')
        .replace(/\n/g, '<br>');

    const apiBase = () => window.location.origin + '/doctor';

    const injectStyles = () => {
        if (document.getElementById('login-announce-styles')) return;
        const style = document.createElement('style');
        style.id = 'login-announce-styles';
        style.textContent = `
            #login-announce-overlay {
                position: fixed;
                inset: 0;
                background: rgba(0, 0, 0, 0.65);
                z-index: 99999;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 20px;
            }
            .login-ann-box {
                background: linear-gradient(180deg, #0c1a2e 0%, #06111f 100%);
                border: 1px solid rgba(142, 236, 255, 0.25);
                border-radius: 16px;
                padding: 24px 28px;
                width: 560px;
                max-width: 92vw;
                max-height: 80vh;
                overflow-y: auto;
                box-shadow: 0 24px 70px rgba(0, 0, 0, 0.55);
                color: #eafcff;
            }
            .login-ann-head {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 16px;
            }
            .login-ann-head h3 {
                margin: 0;
                font-size: 18px;
                color: #ffffff;
            }
            .login-ann-close {
                background: none;
                border: none;
                font-size: 22px;
                cursor: pointer;
                color: #9eb9c9;
                line-height: 1;
            }
            .login-ann-item {
                margin-bottom: 16px;
                padding-bottom: 16px;
                border-bottom: 1px solid rgba(142, 236, 255, 0.15);
            }
            .login-ann-item:last-child {
                margin-bottom: 0;
                padding-bottom: 0;
                border-bottom: none;
            }
            .login-ann-title {
                font-size: 15px;
                font-weight: 600;
                color: #5ef3ff;
                margin-bottom: 8px;
            }
            .login-ann-body {
                font-size: 14px;
                color: #eafcff;
                line-height: 1.6;
                white-space: pre-wrap;
            }
            .login-ann-meta {
                font-size: 12px;
                color: #7a96a8;
                margin-top: 8px;
            }
            .login-ann-foot {
                text-align: right;
                margin-top: 16px;
            }
            .login-ann-ok {
                padding: 8px 24px;
                border: none;
                border-radius: 8px;
                background: linear-gradient(135deg, rgba(94, 243, 255, 0.88), rgba(84, 240, 170, 0.78));
                color: #06111f;
                font-size: 14px;
                font-weight: 600;
                cursor: pointer;
            }
        `;
        document.head.appendChild(style);
    };

    const closeOverlay = () => {
        const el = document.getElementById('login-announce-overlay');
        if (el) el.remove();
    };

    const markPending = () => {
        sessionStorage.setItem(FLAG_KEY, '1');
    };

    const show = async () => {
        try {
            injectStyles();
            const res = await fetch(apiBase() + '/announcementInfo/queryByPage?page=1&size=5', {
                credentials: 'include'
            }).then(r => r.json());
            const list = res && res.code === 1 && res.content && res.content.content
                ? res.content.content
                : [];
            if (!list.length) return;

            closeOverlay();

            const html = list.map(a => (
                '<div class="login-ann-item">' +
                '<div class="login-ann-title">' + escapeHtml(a.title || '') + '</div>' +
                '<div class="login-ann-body">' + escapeHtml(a.content || '') + '</div>' +
                '<div class="login-ann-meta">' + escapeHtml(a.createTime || '') + ' · ' + escapeHtml(a.authorName || '管理员') + '</div>' +
                '</div>'
            )).join('');

            const modal = document.createElement('div');
            modal.id = 'login-announce-overlay';
            modal.innerHTML =
                '<div class="login-ann-box">' +
                '<div class="login-ann-head">' +
                '<h3>📢 系统公告</h3>' +
                '<button type="button" class="login-ann-close" aria-label="关闭">×</button>' +
                '</div>' +
                html +
                '<div class="login-ann-foot"><button type="button" class="login-ann-ok">我已知晓</button></div>' +
                '</div>';

            document.body.appendChild(modal);
            modal.addEventListener('click', (e) => {
                if (e.target === modal) closeOverlay();
            });
            modal.querySelector('.login-ann-close').addEventListener('click', closeOverlay);
            modal.querySelector('.login-ann-ok').addEventListener('click', closeOverlay);
        } catch (e) {
            console.error('加载公告失败', e);
        }
    };

    const showIfPending = async () => {
        if (sessionStorage.getItem(FLAG_KEY) !== '1') return;
        sessionStorage.removeItem(FLAG_KEY);
        await show();
    };

    global.LoginAnnouncements = {
        markPending,
        show,
        showIfPending,
        closeOverlay
    };

    global.showLoginAnnouncements = show;
})(window);
