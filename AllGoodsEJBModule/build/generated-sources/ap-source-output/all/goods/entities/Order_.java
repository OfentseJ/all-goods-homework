package all.goods.entities;

import all.goods.entities.OrderItem;
import all.goods.entities.User;
import java.time.LocalDateTime;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2025-05-10T15:43:42")
@StaticMetamodel(Order.class)
public class Order_ { 

    public static volatile SingularAttribute<Order, Long> id;
    public static volatile SingularAttribute<Order, User> user;
    public static volatile SingularAttribute<Order, LocalDateTime> orderDate;
    public static volatile ListAttribute<Order, OrderItem> items;

}