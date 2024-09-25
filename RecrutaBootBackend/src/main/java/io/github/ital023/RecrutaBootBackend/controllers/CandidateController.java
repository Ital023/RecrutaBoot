package io.github.ital023.RecrutaBootBackend.controllers;

import io.github.ital023.RecrutaBootBackend.dto.CandidateDTO;
import io.github.ital023.RecrutaBootBackend.services.CandidateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

@RestController
@RequestMapping(value = "/candidate")
public class CandidateController {

    @Autowired
    private CandidateService service;

    @GetMapping
    public ResponseEntity<Page<CandidateDTO>> getAll(@RequestParam(name = "name", defaultValue = "") String name,
                                                     Pageable pageable ){
        Page<CandidateDTO> candidateDTOS = service.getAll(name, pageable);
        return ResponseEntity.ok(candidateDTOS);
    }
    
    @PostMapping
    public ResponseEntity<CandidateDTO> save(@RequestBody CandidateDTO candidateDTO) {
        candidateDTO = service.save(candidateDTO);

        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
                .buildAndExpand(candidateDTO.getId())
                .toUri();
        return ResponseEntity.created(uri).body(candidateDTO);
    }

}
