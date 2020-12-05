package com.qcl.request;

import lombok.Data;

import javax.validation.constraints.NotNull;

@Data
public class addMatReq {
    @NotNull(message = "请选择添加食材数量")
    private Integer addNum;
    private Integer matId;
    private Integer matStock;

}
