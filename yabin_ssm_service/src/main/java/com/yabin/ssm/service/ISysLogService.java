package com.yabin.ssm.service;

import com.yabin.ssm.domain.SysLog;

import java.util.List;

public interface ISysLogService {
    void save(SysLog sysLog) throws Exception;

    List<SysLog> findAll() throws Exception;
}
