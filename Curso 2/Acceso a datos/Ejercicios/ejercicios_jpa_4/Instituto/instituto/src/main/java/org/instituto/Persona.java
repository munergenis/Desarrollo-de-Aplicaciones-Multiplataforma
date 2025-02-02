package org.instituto;

import java.time.LocalDate;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.experimental.SuperBuilder;

// Lombok
@Data
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)

// Hibernate
@Entity
@Table(name = "PERSONA")
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)

public abstract class Persona {
	@NonNull
	@EqualsAndHashCode.Include
	@Id
	@Column(length = 10)
	private String nif;
	
	@Column(nullable = false)
	private String nombre;
	
	@Column(nullable = false)
	private LocalDate fechaNacimiento;
	
	@Column(nullable = false)
	private String poblacion;
	
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "emails")
	private Set<Email> emails;
}
