package com.qcl.bean;

import lombok.Data;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.util.Date;

@Entity
@EntityListeners(AuditingEntityListener.class)
@Data
public class FoodMenu {
    @Id
    @GeneratedValue
    private Integer menuId;
    private Integer foodId;//菜品id
    private String foodName;//菜品名
    private Integer matId;//食材id
    private String matName;//食材名称
    private Integer matCost;//耗费食材

    @CreatedDate//自动添加创建时间的注解
    private Date createTime;
    @LastModifiedDate//自动添加更新时间的注解
    private Date updateTime;

}
