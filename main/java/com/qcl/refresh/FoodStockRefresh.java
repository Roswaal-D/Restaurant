package com.qcl.refresh;

import com.qcl.bean.Food;
import com.qcl.bean.FoodMenu;
import com.qcl.bean.Material;
import com.qcl.repository.FoodMenuRepository;
import com.qcl.repository.FoodRepository;
import com.qcl.repository.MaterialRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping
@Slf4j
public class FoodStockRefresh {

    //仓库
    @Autowired
    private FoodRepository foodRepository;
    @Autowired
    private MaterialRepository materialRepository;
    @Autowired
    private FoodMenuRepository foodMenuRepository;

    //遍历

    public void refreash(){
        List<Food> foodList =foodRepository.findAll();
        for(Food food : foodList){
            int min=1000000000;
            List<FoodMenu> foodMenus=foodMenuRepository.findByFoodId(food.getFoodId());
            for(FoodMenu foodMenu : foodMenus){
                Material material=materialRepository.findByMatId(foodMenu.getMatId());
                int tem=material.getMatStock()/foodMenu.getMatCost();
                if(min<tem){
                    min=tem;
                }
            }
            food.setFoodStock(min);
            foodRepository.save(food);
        }
    }
}
