package com.collab.service.login.IF;

import javax.servlet.http.HttpSession;

public interface LoginServiceIF {
    public void keyGenerate(HttpSession session);
}
