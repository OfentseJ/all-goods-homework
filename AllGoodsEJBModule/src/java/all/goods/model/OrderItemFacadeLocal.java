/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package all.goods.model;

import all.goods.entities.OrderItem;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author user
 */
@Local
public interface OrderItemFacadeLocal {

    void create(OrderItem orderItem);

    void edit(OrderItem orderItem);

    void remove(OrderItem orderItem);

    OrderItem find(Object id);

    List<OrderItem> findAll();

    List<OrderItem> findRange(int[] range);

    int count();
    
}
