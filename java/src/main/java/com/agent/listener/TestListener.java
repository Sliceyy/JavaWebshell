package com.agent.listener;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;

public class TestListener implements ServletRequestListener {
    @Override
    public void requestInitialized(ServletRequestEvent sre) {
        System.out.println("执行了TestListener requestInitialized");
    }
    @Override
    public void requestDestroyed(ServletRequestEvent sre) {
        System.out.println("执行了TestListener requestDestroyed");
    }
}

