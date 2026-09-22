package com.dyh.doctor;

import com.dyh.doctor.util.ReturnVO;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class AdminAuthInterceptor implements HandlerInterceptor {
    // Unified mapping in this project: admin=0, doctor=1, patient=2.
    private static final Integer ADMIN_ROLE = 0;
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object roleObj = request.getSession().getAttribute("loginRoleType");
        boolean isAdmin = roleObj instanceof Integer && ADMIN_ROLE.equals(roleObj);
        if (isAdmin) {
            return true;
        }

        ReturnVO returnVO = new ReturnVO();
        returnVO.setCode(0);
        returnVO.setMsg("仅管理员可执行该操作，请使用管理员账号登录");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write(objectMapper.writeValueAsString(returnVO));
        return false;
    }
}

