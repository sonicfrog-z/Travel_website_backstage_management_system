package com.yabin.ssm.service;

import com.yabin.ssm.domain.Permission;

import java.util.List;

public interface IPermissionService {
    List<Permission> findAll() throws Exception;

    void save(Permission permission) throws Exception;
}
