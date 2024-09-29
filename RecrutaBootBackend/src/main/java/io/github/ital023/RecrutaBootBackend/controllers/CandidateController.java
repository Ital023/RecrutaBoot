package io.github.ital023.RecrutaBootBackend.controllers;

import io.github.ital023.RecrutaBootBackend.dto.CandidateDTO;
import io.github.ital023.RecrutaBootBackend.dto.CandidateMinDTO;
import io.github.ital023.RecrutaBootBackend.entities.Candidate;
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

    @GetMapping("/favorite")
    public ResponseEntity<List<CandidateMinDTO>> getAllFavorites(){
        List<CandidateMinDTO> favorites = service.getAllFavorites();

        return ResponseEntity.ok(favorites);
    }

    @GetMapping("/pageable")
    public ResponseEntity<Page<CandidateMinDTO>> getAllPageable(@RequestParam(name = "name", defaultValue = "") String name,
                                                                Pageable pageable ){
        Page<CandidateMinDTO> candidateDTOS = service.getAll(name, pageable);
        return ResponseEntity.ok(candidateDTOS);
    }

    @GetMapping("/{id}")
    public ResponseEntity<CandidateDTO> getById(@PathVariable Long id) {
        CandidateDTO candidateDTO = service.getById(id);
        return ResponseEntity.ok(candidateDTO);
    }
    
    @PostMapping
    public ResponseEntity<CandidateDTO> save(@RequestBody CandidateDTO candidateDTO) {
        candidateDTO = service.save(candidateDTO);

        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
                .buildAndExpand(candidateDTO.getId())
                .toUri();
        return ResponseEntity.created(uri).body(candidateDTO);
    }

    @PutMapping("/{id}")
    public ResponseEntity<CandidateDTO> update(@RequestBody CandidateDTO candidateDTO,@PathVariable Long id) {
        candidateDTO = service.updateCandidate(candidateDTO, id);
        return ResponseEntity.ok(candidateDTO);
    }

    @PutMapping("/favorite/{id}")
    public ResponseEntity<Void> updateFavorite(@PathVariable Long id) {
        service.updateFavorite(id);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }

}
