package com.qcl.repository;


import com.qcl.bean.FoodMenu;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FoodMenuRepository extends JpaRepository<FoodMenu,Integer> {

    List<FoodMenu> findByFoodId(Integer foodId);


}

