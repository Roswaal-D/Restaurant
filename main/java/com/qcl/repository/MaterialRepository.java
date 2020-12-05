package com.qcl.repository;

import com.qcl.bean.Material;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
   食材repository
 */
public interface MaterialRepository extends JpaRepository<Material,Integer> {

    List<Material> findByMatStockLessThan(int num);
    List<Material> findByLeimuTypeEquals(int leimu);
    Material findByMatId(int matId);
}
