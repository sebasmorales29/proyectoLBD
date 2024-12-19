
package com.pizzeria.pizzeria;
import java.time.LocalDate;
import java.math.BigDecimal;
import jakarta.persistence.*;
import org.hibernate.annotations.Immutable;

@Entity
@Table(name = "FACTURA")
public class Factura {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_FACTURA")
    private Long idFactura;

    @Column(name = "FECHA")
    private LocalDate fecha;

    @Column(name = "TOTAL")
    private BigDecimal total;

    @ManyToOne
    @JoinColumn(name = "ID_USUARIO", nullable = false)
    private Usuario usuario;

    // Getters, setters, constructores
}
