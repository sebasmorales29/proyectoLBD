
CREATE OR REPLACE PACKAGE BODY facturacion AS
    --Funcion para calcular el descuento de una factura.
    FUNCTION CalculaDescuento(
        --recibe el total de la factura
        p_total_factura NUMBER,  
        --recibe el descuento a aplicar
        p_descuento_porcentaje NUMBER   
        )
    RETURN DECIMAL
    IS
        --Almacenar el resultado a retornar
        v_total DECIMAL;  
    BEGIN


        --Calcular descuento
        v_total := p_total_factura - (p_total_factura * (p_descuento_porcentaje / 100));
    
        RETURN v_total;
    END CalculaDescuento;
    
    
    
    
    
    /*******************************************************************************************/
    --Con esta funcion calculamos el total de la factura utilizando la tabla detalle_factra
    FUNCTION CalculaTotalFactura(
    --Recibimos por parametro el id de la factura para recorrer la tabla 
    --detalle_factura, la cual contiene como FK el ID de factura
    p_id_factura IN NUMBER  
    )
    RETURN NUMBER
    IS
        --Declaramos las variables
        v_total NUMBER := 0;
        v_precio NUMBER;
        v_cantidad NUMBER;

        --Con este cursor recorremos las lineas que tienen el id Factura
        CURSOR cur_detalle_factura IS
            SELECT precio, cantidad
            FROM items_factura
            WHERE id_factura = p_id_factura;
    BEGIN
   
        OPEN cur_detalle_factura;
        LOOP
            FETCH cur_detalle_factura INTO v_precio, v_cantidad;

            --Sale de este loop cuando no hay mas lineas para el id_factura
            EXIT WHEN cur_detalle_factura%NOTFOUND;
        
            --Calculamos total por cada item y lo acumulamos en total
            v_total := v_total + (v_precio * v_cantidad);
        END LOOP;
        CLOSE cur_detalle_factura;
        RETURN v_total;
    END CalculaTotalFactura;
    
    
    
    /*******************************************************************************************/

    --Procedimiento utilizada para actualizar el total de la factura
    PROCEDURE ActualizaTotalFactura(
    --Se recibe como parametro el id de la factura recientemente creada
    p_id_factura IN NUMBER
    )
    IS
        v_total NUMBER;
    BEGIN
   
        v_total := CalculaTotalFactura(p_id_factura);
        UPDATE Factura
        SET total = v_total
        WHERE id_factura = p_id_factura;
    
        COMMIT;
    END ActualizaTotalFactura;
    
    
    /*******************************************************************************************/
    
    
    --Esta funcion se utiliza para poder obtener el total de las ventas por cliente
    FUNCTION SumaTotalFacturas(p_id_usuario NUMBER)
    RETURN NUMBER
    IS
        --variable para acumular los totales de las facturas
        v_total_facturas NUMBER := 0; 
        v_total NUMBER;
        CURSOR cur_total_factura IS
            SELECT total FROM vista_factura
            WHERE id_usuario = p_id_usuario;
    BEGIN
        OPEN cur_total_factura;

        -- recorrer la tabla y obtener el total de cada factura relacionada con el cliente
        LOOP
            FETCH cur_total_factura INTO v_total;
        
            -- Salir del loop si no hay más registros
            EXIT WHEN cur_total_factura%NOTFOUND;

            --calcular el total de las facturas
            v_total_facturas := v_total_facturas + v_total;
        END LOOP;

        -- Cerrar el cursor
        CLOSE cur_total_factura;

        -- Devolver el total acumulado
        RETURN v_total_facturas;
    END SumaTotalFacturas;
    
    
    /*******************************************************************************************/

--Esta funcion se utiliza para poder obtener el total de las ventas por cliente segun su ubicacion
    FUNCTION TotalVentasPorUbicacion(
    --Recibe por parametro 
    p_provincia IN VARCHAR2  
    )
    RETURN NUMBER
    IS
  
        v_total_venta NUMBER := 0;  
        v_factura_total NUMBER;      

        -- Definir el cursor
        CURSOR cur_facturas IS
            SELECT f.total
            FROM Factura f
            JOIN Usuario u ON f.id_usuario = u.id_usuario
            JOIN Direccion d ON u.id_usuario = d.id_usuario
            WHERE d.provincia = p_provincia;
    BEGIN
  
        OPEN cur_facturas;

        LOOP
            FETCH cur_facturas INTO v_factura_total;

            EXIT WHEN cur_facturas%NOTFOUND;

            v_total_venta := v_total_venta + v_factura_total;
        END LOOP;


        CLOSE cur_facturas;

        RETURN v_total_venta;
    END TotalVentasPorUbicacion;
    
    
END facturacion;


--*******************************************************************************************

CREATE OR REPLACE PACKAGE facturacion AS
     FUNCTION CalculaDescuento( 
        --recibe el total de la factura
        p_total_factura NUMBER,  
        --recibe el descuento a aplicar
        p_descuento_porcentaje NUMBER)RETURN DECIMAL;                                 



    FUNCTION CalculaTotalFactura(
        p_id_factura IN NUMBER  
        )RETURN NUMBER;



     PROCEDURE ActualizaTotalFactura(
        --Se recibe como parametro el id de la factura recientemente creada
        p_id_factura IN NUMBER);
        
        
        
    FUNCTION SumaTotalFacturas(p_id_usuario NUMBER)
    RETURN NUMBER;
    
    FUNCTION TotalVentasPorUbicacion(
    --Recibe por parametro 
    p_provincia IN VARCHAR2  
    )
    RETURN NUMBER;

END facturacion;















CREATE OR REPLACE VIEW items_factura AS
SELECT id_factura,precio, cantidad
        FROM detalle_factura;

/*******************************************************************************************/

CREATE OR REPLACE VIEW vista_factura AS
SELECT id_factura,fecha, total,id_usuario
        FROM factura;











/*******************************************************************************************/

--Esta funcion se utiliza para poder obtener el total de las ventas por cliente segun su ubicacion
CREATE OR REPLACE FUNCTION TotalVentasPorUbicacion(
    --Recibe por parametro 
    p_provincia IN VARCHAR2  
)
RETURN NUMBER
IS
  
    v_total_venta NUMBER := 0;  
    v_factura_total NUMBER;      

    -- Definir el cursor
    CURSOR cur_facturas IS
        SELECT f.total
        FROM Factura f
        JOIN Usuario u ON f.id_usuario = u.id_usuario
        JOIN Direccion d ON u.id_usuario = d.id_usuario
        WHERE d.provincia = p_provincia;
BEGIN
  
    OPEN cur_facturas;

    LOOP
        FETCH cur_facturas INTO v_factura_total;

        EXIT WHEN cur_facturas%NOTFOUND;

        v_total_venta := v_total_venta + v_factura_total;
    END LOOP;


    CLOSE cur_facturas;

    RETURN v_total_venta;
END;
/






















--***********************Pruebas de funciones-------------------- -------------------- --------------------
--Calcular descuento
DECLARE
    total NUMBER := 1000;
    descuento NUMBER := 10;
    total_descuento DECIMAL;
BEGIN
    total_descuento := facturacion.CalculaDescuento(total, descuento);
    DBMS_OUTPUT.PUT_LINE('Total con descuento: ' || total_descuento);
END;

-------------------- -------------------- --------------------

--Calcular total 
DECLARE
    total_factura DECIMAL;
BEGIN
    total_factura := facturacion.CalculaTotalFactura(1);
    DBMS_OUTPUT.PUT_LINE('Total factura: ' || total_factura);
END;


-------------------- -------------------- --------------------


--Actualizar total d la factura

DECLARE
    
BEGIN
    facturacion.ActualizaTotalFactura(1);
    
END;




-------------------- -------------------- --------------------

--Calcular el total de todas las facturas de un cliente
DECLARE
    total_facturas DECIMAL;
BEGIN
    total_facturas := facturacion.SumaTotalFacturas(1);
    DBMS_OUTPUT.PUT_LINE('Total facturas por cliente: ' || total_facturas);
END;



DECLARE
    total_facturas_ubicacion DECIMAL;
BEGIN
    total_facturas_ubicacion := facturacion.totalventasporubicacion('Alajuela');
    DBMS_OUTPUT.PUT_LINE('Total facturas por ubicacion: ' || total_facturas_ubicacion);
END;

