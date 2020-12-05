package com.qcl.controller;


import com.qcl.bean.Food;
import com.qcl.bean.FoodMenu;
import com.qcl.bean.MatType;
import com.qcl.bean.Material;
import com.qcl.repository.FoodMenuRepository;
import com.qcl.repository.FoodRepository;
import com.qcl.repository.MatTypeRepository;
import com.qcl.repository.MaterialRepository;
import com.qcl.request.MatReq;
import com.qcl.request.addMatReq;

import com.qcl.utils.ExcelImportUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.List;


@Controller
@RequestMapping("/material")
@Slf4j
public class MaterialController {

    @Autowired
    private MaterialRepository materialRepository;

    @Autowired
    private MatTypeRepository matTypeRepository;

    @Autowired
    private FoodRepository foodRepository;
    @Autowired
    private FoodMenuRepository foodMenuRepository;

    @GetMapping("/list")
    public String list(@RequestParam(value = "page",defaultValue = "1") Integer page,
                       @RequestParam(value = "size",defaultValue = "10") Integer size,
                       ModelMap map){


        PageRequest request=PageRequest.of(page - 1,size);
        Page<Material> materialPage = materialRepository.findAll(request);
        map.put("materialPage",materialPage);
        map.put("currentPage",page);
        map.put("size",size);
        return "material/list";
    }

    @GetMapping("/index")
    public String index(@RequestParam(value = "matId",required = false) Integer matId,
                        ModelMap map){



        Material material;
        if(matId!=null){
            material=materialRepository.findById(matId).orElse(null);
            map.put("material",material);
        }

        List<MatType> matTypeList = matTypeRepository.findAll();
        map.put("matTypeList",matTypeList);
        return "material/index";
    }

    //食材添加或更新
    @PostMapping("/save")
    public String save(@Valid MatReq form,
                       BindingResult bindingResult,
                       ModelMap map) {

        //System.out.println(form.getMatName());

        if (bindingResult.hasErrors()) {
            map.put("msg", bindingResult.getFieldError().getDefaultMessage());
            map.put("url", "/diancan/material/index");
            return "zujian/error";
        }

        Material productInfo = new Material();
        try {
            //如果productId为空, 说明是新增
            if (!StringUtils.isEmpty(form.getMatId())) {
                productInfo = materialRepository.findById(form.getMatId()).orElse(null);
            }
            BeanUtils.copyProperties(form, productInfo);
            materialRepository.save(productInfo);

        } catch (Exception e) {
            log.error("添加食材错误={}", e);
            map.put("msg", "添加食材出错");
            map.put("url", "/diancan/material/index");
            return "zujian/error";
        }


        map.put("url", "/diancan/food/init?nextUrl=/diancan/material/list");
        return "zujian/success";
    }

//    //删除某个食材
//    @GetMapping("/remove")
//    public String remove(@RequestParam(value = "matId", required = false) Integer matId,
//                         ModelMap map) {
//        materialRepository.deleteById(matId);
//
//        map.put("url", "/diancan/material/list");
//        return "zujian/success";
//    }

    //补货
    @PostMapping("/addStock")
    public String addStock(@Valid addMatReq form,
                           BindingResult bindingResult,
                           ModelMap map){

        //System.out.println("OHHHHHHHHHHHHHHHHHHHHHHHHHH");

        if (bindingResult.hasErrors()) {
            map.put("msg", bindingResult.getFieldError().getDefaultMessage());
            map.put("url", "/diancan/material/index");
            return "zujian/error";
        }

        Material productInfo;
        try {

            productInfo = materialRepository.findById(form.getMatId()).orElse(null);

            MatReq fform=new MatReq();
            fform.setMatId(form.getMatId());
            fform.setMatName(productInfo.getMatName());
            fform.setMatStock(form.getMatStock()+form.getAddNum());
            fform.setLeimuType(productInfo.getLeimuType());

            BeanUtils.copyProperties(fform, productInfo);
            materialRepository.save(productInfo);
        } catch (Exception e) {
            log.error("添加菜品错误={}", e);
            map.put("msg", "添加菜品出错");
            map.put("url", "/diancan/material/index");
            return "zujian/error";
        }

        map.put("url", "/diancan/food/init?nextUrl=/diancan/material/list");

        return "zujian/success";
    }

    @GetMapping("/excel")
    public String excel(ModelMap map) {
        return "material/excel";
    }

    @RequestMapping("/uploadExcel")
    public String uploadExcel(@RequestParam("file") MultipartFile file,
                              ModelMap map) {
        String name = file.getOriginalFilename();
        if (name.length() < 6 || !name.substring(name.length() - 5).equals(".xlsx")) {
            map.put("msg", "文件格式错误");
            map.put("url", "/diancan/material/excel");
            return "zujian/error";
        }
        List<Material> list;
        try {
            list = ExcelImportUtils.excelToMatInfoList(file.getInputStream());
            log.info("excel导入的list={}", list);
            if (list == null || list.size() <= 0) {
                map.put("msg", "导入失败");
                map.put("url", "/diancan/material/excel");
                return "zujian/error";
            }
            //excel的数据保存到数据库
            try {
                for (Material excel : list) {
                    if (excel != null) {
                        materialRepository.save(excel);
                    }
                }
            } catch (Exception e) {
                log.error("某一行存入数据库失败={}", e);
            }

        } catch (Exception e) {
            e.printStackTrace();
            map.put("msg", e.getMessage());
            map.put("url", "/diancan/material/excel");
            return "zujian/error";
        }
        map.put("url", "/diancan/food/init?nextUrl=/diancan/material/list");

        return "zujian/success";
    }


}
