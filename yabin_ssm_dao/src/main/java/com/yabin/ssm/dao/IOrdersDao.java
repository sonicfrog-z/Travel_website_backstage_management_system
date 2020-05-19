package com.yabin.ssm.dao;

import com.yabin.ssm.domain.Member;
import com.yabin.ssm.domain.Orders;
import com.yabin.ssm.domain.Product;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IOrdersDao {
    @Select("select * from orders")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "orderNum", column = "orderNum"),
            @Result(property = "orderTime", column = "orderTime"),
            @Result(property = "orderTimeStr", column = "orderTimeStr"),
            @Result(property = "orderStatus", column = "orderStatus"),
            @Result(property = "peopleCount", column = "peopleCount"),
//            @Result(property = "travellers", column = "travellers"),
//            @Result(property = "member", column = "member"),
            @Result(property = "payType", column = "payType"),
//            @Result(property = "payTypeStr", column = "payTypeStr"),
            @Result(property = "orderDesc", column = "orderDesc"),
            @Result(property = "product", column = "productId", javaType = Product.class, one = @One(
                    select = "com.yabin.ssm.dao.IProductDao.findById")),

    })
    public List<Orders> findAll() throws Exception;

    @Select("select * from orders where id = #{ordersId}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "orderNum", column = "orderNum"),
            @Result(property = "orderTime", column = "orderTime"),
            @Result(property = "orderTimeStr", column = "orderTimeStr"),
            @Result(property = "orderStatus", column = "orderStatus"),
            @Result(property = "peopleCount", column = "peopleCount"),
            @Result(property = "payType", column = "payType"),
            @Result(property = "orderDesc", column = "orderDesc"),
            @Result(property = "product", column = "productId", javaType = Product.class, one = @One(
                    select = "com.yabin.ssm.dao.IProductDao.findById")),
            @Result(property = "member", column = "memberId", javaType = Member.class, one = @One(
                    select = "com.yabin.ssm.dao.IMemberDao.findById")),
            @Result(property = "travellers", column = "id", javaType = List.class, many = @Many(
                    select = "com.yabin.ssm.dao.ITravellerDao.findByOrdersId")),

    })
    public Orders findById(String ordersId) throws Exception;
}
