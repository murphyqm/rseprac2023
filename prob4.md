When approached with a query that necessitates a **requirements analysis**, ideally a requirements analysis process template or workflow is available to follow; this saves time on behalf of the RSE team, reduces errors during the analysis, helps to avoid oversights that may become costly further down the line, and allows for better comparison between different projects. While this template or workflow may vary in specifics from team to team and depending on the workflow model being used (for example, Agile), I’ve outlined some general principles below.

The first step in carrying out requirements analysis for this query is to **gather requirements**.  In this stage, we need to identify the relevant stakeholders, establish the goals of the project, identify requirements with stakeholders, then document, review and prioritise the requirements. This can be done through correspondence and/ or meetings with the involved stakeholders, in this case the first point of contact being the researcher who inquired.

It is important to focus on the functional requirements initially, e.g. the “what” of the query - **what** does the program need to do, **what** output is required; as opposed to the non-functional requirements, or the “how” of the program implementation. Once the key functional requirements are nailed down, the actual implementation details can be decided on.

Important questions at this stage include:
- Who are the relevant stakeholders? Who are the decision makers, users, research groups, funders etc., and are there any “hidden” stakeholders whose input is needed?
- What are the goals and objectives of the project?
- What is the problem that needs to be solved?
- How is “success” defined for this project? What is the definition of “done”?
- What is the simplest/most minimal implementation that meets the basic “success” criteria or the definition of “done”?
- In this specific case, what type of data needs to be collected, and at what scale?
- What end result “output” is desired? A program/GUI, dataset, etc.?
- What are the constraints of the project?
    - What time-frame requirements are there? What funding is available? Are these feasible given the scope of the project?
        - Underestimation of time needed for tasks such as documentation, discussions etc. can lead to delays/increase in costs
        - Scope-creep due to ill-defined requirements additionally can lead to delays
    - What specific requirements do certain stakeholders have (e.g. funding body might require specific archival of research data, researcher might need to store data in compliance with GDPR)
    - Computational practicalities (certain languages, databases, etc.)?

Requirements can then be generated according to the different objectives identified for the project. Documenting the requirements from this initial stage onwards allows traceability across iterations and changes.

These requirements can then be **evaluated, analysed and synthesised**. The requirements should be reviewed with stakeholders, ensuring that there is no ambiguity (with updates made as needed) and that the requirements capture the objectives of the project completely. It is also important that there is a shared understanding of the requirements between both the stakeholders and the RSE team to ensure no conflicts. Any broad statements should be scrutinised to uncover any underlying assumptions that might not be shared between stakeholders/the RSE team: requirements should be explicit, not implicit.

As part of the analysis phase, **modelling and prototyping** can be used to validate the requirements: simple prototypes can be used to address feasibility and inform potential revisions to the requirements. A test suite should be implemented as early as possible. Some useful questions at this stage include:
- Can requirements be feasibly met?
- Can a robust testing infrastructure be put in place at an early stage
- Are there likely scheduling conflicts/delays that will impact development?
- Do certain requirements depend on uncertain outcomes? Can risk associated with this be mitigated?

Based on the outcomes of this analysis and prototyping, requirements can be updated and improved upon, with the involvement again of the stakeholders.

Stakeholder sign-off should be obtained for each requirement. At this point, it can be useful to prioritise requirements alongside stakeholders into categories such as “essential/must have”, “high want” and “nice to have” or equivalent, with further prioritisation and ordering within these groups. While unambiguous requirements should help to limit delays (by reducing scope-creep and hopefully estimating time accurately), unforeseeable delays can occur and this ensures that the criteria of “success” can be met, even if certain requirements can not be completed.

The requirements will need to be **documented** clearly from their inception onwards through development. The documentation should be available for review by all stakeholders, should be straightforward to navigate, should involve versioning control and include links to other documentation as required.

Sources:

["Highly Performant Data Science Teams" in *High Performance Python*, 2ed, Micha Gorelick and Ian Ozsvald (2020, O'Reilly)](https://www.oreilly.com/library/view/high-performance-python/9781492055013/)

["What is requirements gathering?" in *The Essential Guide to Requirements Management and Traceability*, Jama Software Blog](https://www.jamasoftware.com/requirements-management-guide/requirements-gathering-and-management-processes/what-is-requirements-gathering)

["Software Requirements Gathering Techniques: A Formula For Success", on Praxent blog](https://praxent.com/blog/software-requirements-gathering-formula-success)

["What is Requirement Analysis: Overview, Applications, and More" on Simplilearn educational platform](https://www.simplilearn.com/what-is-requirement-analysis-article)

