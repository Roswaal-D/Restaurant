package com.qcl.request;

import lombok.Data;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.NotNull;

@Data
public class MatReq {
    private Integer matId;//材料id
    @NotNull(message = "食材名称必填")
    private String matName;//材料名
    @NotNull(message = "食材库存必填")
    private Integer matStock;//材料库存
    private Integer leimuType;//材料类目

}
