package com.qcl.bean;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.qcl.meiju.FoodStatusEnum;
import com.qcl.utils.EnumUtil;
import lombok.Data;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 商品
 */
@Entity
@Data
@EntityListeners(AuditingEntityListener.class)
public class Material {
    @Id
    @GeneratedValue
    private Integer matId;//材料id

    private String matName;//材料名
    private Integer matStock;//材料库存
    private Integer leimuType;//材料类目
    private Integer adminId;//材料属于那个商家

    @CreatedDate//自动添加创建时间的注解
    private Date createTime;
    @LastModifiedDate//自动添加更新时间的注解
    private Date updateTime;



}
