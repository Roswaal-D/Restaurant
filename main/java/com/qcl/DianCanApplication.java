package com.qcl;

import com.qcl.refresh.FoodStockRefresh;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class DianCanApplication {

	public static void main(String[] args) {
		SpringApplication.run(DianCanApplication.class, args);
//		FoodStockRefresh foodStockRefresh=new FoodStockRefresh();
//		foodStockRefresh.refreash();
	}
}
