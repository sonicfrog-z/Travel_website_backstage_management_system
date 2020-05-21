package com.yabin.ssm.dao;

import com.yabin.ssm.domain.Role;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IRoleDao {
    @Select("select * from role where id in (select roleId from users_role where userId = #{userId})")
    public List<Role> findRoleByUserId(String userId) throws Exception;
}
