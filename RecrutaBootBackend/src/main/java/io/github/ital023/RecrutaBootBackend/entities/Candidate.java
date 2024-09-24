package io.github.ital023.RecrutaBootBackend.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "tb_candidate")
public class Candidate {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;
    private String description;
    @Column(columnDefinition = "TEXT")
    private String avatarUrl;


}
