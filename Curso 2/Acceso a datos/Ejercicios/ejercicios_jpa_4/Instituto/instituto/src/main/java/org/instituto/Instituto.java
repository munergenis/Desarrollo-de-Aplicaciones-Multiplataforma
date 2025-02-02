package org.instituto;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.NonNull;

// Lombok
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)

//Hibernate
@Entity
@Table(name = "INSTITUTO")

public class Instituto {
	@Column(nullable = false)
	private String nombre;
	
	@NonNull
	@EqualsAndHashCode.Include
	@Column()
	private String codigo;
	
	@Column(nullable = false)
	private String telfefono;
	
	@Embedded
	private Direccion direccion;
}
