package com.qcl.controller;


import com.qcl.bean.FoodMenu;
import com.qcl.repository.FoodMenuRepository;
import com.qcl.utils.ExcelImportUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequestMapping("/foodMenu")
@Slf4j
public class FoodMenuController {
    @Autowired
    private FoodMenuRepository foodMenuRepository;

    @GetMapping("/excel")
    public String excel(ModelMap map){
        return "foodMenu/excel";
    }

    @RequestMapping("/uploadExcel")
    public String uploadExcel(@RequestParam("file") MultipartFile file,
                              ModelMap map) {
        String name = file.getOriginalFilename();
        if (name.length() < 6 || !name.substring(name.length() - 5).equals(".xlsx")) {
            map.put("msg", "文件格式错误");
            map.put("url", "/diancan/foodMenu/excel");
            return "zujian/error";
        }
        List<FoodMenu> list;
        try {
            list = ExcelImportUtils.excelToFoodMenuInfoList(file.getInputStream());
            log.info("excel导入的list={}", list);
            if (list == null || list.size() <= 0) {
                map.put("msg", "导入失败");
                map.put("url", "/diancan/foodMenu/excel");
                return "zujian/error";
            }
            //excel的数据保存到数据库
            try {
                for (FoodMenu excel : list) {
                    if (excel != null) {
                        foodMenuRepository.save(excel);
                    }
                }
            } catch (Exception e) {
                log.error("某一行存入数据库失败={}", e);
            }

        } catch (Exception e) {
            e.printStackTrace();
            map.put("msg", e.getMessage());
            map.put("url", "/diancan/foodMenu/excel");
            return "zujian/error";
        }
        map.put("url", "/diancan/foodMenu/excel");
        return "zujian/success";
    }
}
