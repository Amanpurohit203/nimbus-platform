# ADR-001: Use a Monorepo for Nimbus Platform

## Status

Accepted

## Date

2026-07-15

---

## Context

Nimbus Platform is an enterprise-grade cloud-native internal developer platform.

The platform contains multiple components that evolve together, including:

- Infrastructure as Code (Terraform)
- Kubernetes manifests
- Helm charts
- GitHub Actions workflows
- Python automation tools
- Backend microservices
- Kafka data pipeline
- Spark analytics jobs
- Platform documentation

Managing these components across multiple repositories would increase operational complexity during development and make it harder to understand the complete system architecture.

---

## Decision

Nimbus Platform will use a **Monorepo** approach.

All platform components will be maintained within a single Git repository.

The repository will contain infrastructure, platform services, automation, documentation, observability configuration, and deployment manifests.

---

## Consequences

### Advantages

- Single source of truth
- Easier dependency management
- Simplified development workflow
- Easier onboarding for new contributors
- Atomic commits across multiple components
- Simplified CI/CD pipeline
- Better visibility of the overall platform architecture

### Disadvantages

- Repository size will grow over time
- CI/CD pipelines may become more complex
- Requires clear folder organization
- Teams must follow consistent coding standards

---

## Alternatives Considered

### Multi-Repository

Each service would have its own repository.

**Rejected because:**

- Higher maintenance overhead
- Harder to synchronize infrastructure and application changes
- More complex CI/CD management
- Less suitable for a portfolio project demonstrating an integrated platform

---

## Decision Outcome

The monorepo approach provides the best balance between simplicity, maintainability, and scalability for Nimbus Platform.

As the platform evolves, additional services, infrastructure modules, and automation tools can be added without changing the repository structure.

---

## References

- Repository Structure Documentation
- Platform Architecture