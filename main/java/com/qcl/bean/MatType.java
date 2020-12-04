package com.qcl.bean;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.Data;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

/**
 * 菜品类目表
 */
@Entity
@EntityListeners(AuditingEntityListener.class)
@Data
public class MatType {
    //类目id
    @Id
    @GeneratedValue
    private Integer typeId;
    private Integer adminId;//菜品属于那个商家
    private String typeName;//类目名字
    private Integer TypeNum;//类目编号
    @CreatedDate//自动添加创建时间的注解
    private Date createTime;
    @LastModifiedDate//自动添加更新时间的注解
    private Date updateTime;


}
