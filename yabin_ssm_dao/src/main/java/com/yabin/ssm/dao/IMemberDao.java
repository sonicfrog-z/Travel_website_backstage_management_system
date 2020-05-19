package com.yabin.ssm.dao;

import com.yabin.ssm.domain.Member;
import org.apache.ibatis.annotations.Select;

public interface IMemberDao {
    @Select("select * from itcast.member where id=#{id}")
    public Member findById(String id) throws Exception;
}
