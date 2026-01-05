using { managed } from '@sap/cds/common';

namespace sales;

entity SalesOrderHeaders: managed {
    key id: UUID;
        customers: Association to Customers;
        totalAmount: Decimal(15,2); //Ele pode ter até 15 digitos considerando após a virgula, a casa dois seria o ponto flutuante que é os numeros alem da virgula. Entao basicamente esses numeros delimitao quantos numeros vao ter em cada area 
        items: Composition of many SalesOrderItems on items.header = $self;     
}

entity SalesOrderItems {
    key id: UUID;
        header: Association to SalesOrderHeaders;
        product: Association to Products;
        quantity: Integer;
        price: Decimal(15,2);
}

entity Customers {
    key id: UUID;
        firstName: String(20);
        lastName: String(100);
        email: String(255);
}

entity Products {
    key id: UUID;
        name: String(255);
        price: Decimal(15,2);
}