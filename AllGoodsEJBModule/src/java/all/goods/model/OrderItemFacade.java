/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package all.goods.model;

import all.goods.entities.OrderItem;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author user
 */
@Stateless
public class OrderItemFacade extends AbstractFacade<OrderItem> implements OrderItemFacadeLocal {

    @PersistenceContext(unitName = "AllGoodsEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OrderItemFacade() {
        super(OrderItem.class);
    }
    
}
