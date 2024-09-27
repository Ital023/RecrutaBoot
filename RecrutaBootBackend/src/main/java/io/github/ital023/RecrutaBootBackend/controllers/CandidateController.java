package io.github.ital023.RecrutaBootBackend.controllers;

import io.github.ital023.RecrutaBootBackend.dto.CandidateMinDTO;
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
    public ResponseEntity<List<CandidateMinDTO>> findAll(){
        List<CandidateMinDTO> candidateMinDTOS = service.findAll();
        return ResponseEntity.ok(candidateMinDTOS);
    }

    @GetMapping("/pageable")
    public ResponseEntity<Page<CandidateMinDTO>> getAllPageable(@RequestParam(name = "name", defaultValue = "") String name,
                                                                Pageable pageable ){
        Page<CandidateMinDTO> candidateDTOS = service.getAll(name, pageable);
        return ResponseEntity.ok(candidateDTOS);
    }

    @GetMapping("/{id}")
    public ResponseEntity<CandidateMinDTO> getById(@PathVariable Long id) {
        CandidateMinDTO candidateMinDTO = service.getById(id);
        return ResponseEntity.ok(candidateMinDTO);
    }
    
    @PostMapping
    public ResponseEntity<CandidateMinDTO> save(@RequestBody CandidateMinDTO candidateMinDTO) {
        candidateMinDTO = service.save(candidateMinDTO);

        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
                .buildAndExpand(candidateMinDTO.getId())
                .toUri();
        return ResponseEntity.created(uri).body(candidateMinDTO);
    }

}
