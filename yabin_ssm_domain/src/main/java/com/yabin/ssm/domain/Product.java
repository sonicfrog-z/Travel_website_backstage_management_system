package com.yabin.ssm.domain;

import com.yabin.ssm.utils.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Product class info
 */
public class Product {
    private String id; // primary key
    private String productNum; // uniq
    private String productName;
    private String cityName; // Departure City
    @DateTimeFormat(pattern = "MM/dd/yyyy HH:mm")
    private Date departureTime;
    private String departureTimeStr;
    private double productPrice; // Price
    private String productDesc; // product description
    private Integer productStatus; // 0-closed, 1-open
    private String productStatusStr;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProductNum() {
        return productNum;
    }

    public void setProductNum(String productNum) {
        this.productNum = productNum;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public Date getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(Date departureTime) {
        this.departureTime = departureTime;
    }

    public String getDepartureTimeStr() {
        if (departureTime!=null){
            departureTimeStr = DateUtils.date2String(departureTime, "MM/dd/yyyy");
        }
        return departureTimeStr;
    }

    public void setDepartureTimeStr(String departureTimeStr) {
        this.departureTimeStr = departureTimeStr;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductDesc() {
        return productDesc;
    }

    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

    public Integer getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(Integer productStatus) {
        this.productStatus = productStatus;
    }

    public String getProductStatusStr() {
        //status: 0 - close, 1 - open
        if (productStatus != null) {
            if (productStatus == 0) productStatusStr = "Closed";
            if (productStatus == 1) productStatusStr = "Open";
        }
        return productStatusStr;
    }

    public void setProductStatusStr(String productStatusStr) {
        this.productStatusStr = productStatusStr;
    }


}
