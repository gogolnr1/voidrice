#!/bin/python3

import ast
from dataclasses import dataclass
from typing import List, Dict, Set
from collections import defaultdict

@dataclass
class CodebaseStructure:
    """Represents the essential structure of a Python codebase"""
    imports: Set[str]
    classes: Dict[str, 'ClassStructure']
    constants: Dict[str, any]
    main_functions: List[str]

@dataclass
class ClassStructure:
    """Represents the structure of a Python class"""
    name: str
    methods: List[str]
    attributes: Dict[str, str]
    dependencies: Set[str]
    parent_classes: List[str]

class CodebaseAnalyzer:
    def __init__(self, code: str):
        self.tree = ast.parse(code)

    def analyze(self) -> CodebaseStructure:
        imports = self._extract_imports()
        constants = self._extract_constants()
        classes = self._extract_classes()
        main_functions = self._extract_main_functions()

        return CodebaseStructure(
            imports=imports,
            classes=classes,
            constants=constants,
            main_functions=main_functions
        )

    def _extract_imports(self) -> Set[str]:
        imports = set()
        for node in ast.walk(self.tree):
            if isinstance(node, ast.Import):
                for name in node.names:
                    imports.add(name.name)
            elif isinstance(node, ast.ImportFrom):
                imports.add(f"{node.module}")
        return imports

    def _extract_constants(self) -> Dict[str, any]:
        constants = {}
        for node in self.tree.body:
            if isinstance(node, ast.Assign):
                for target in node.targets:
                    if isinstance(target, ast.Name) and target.id.isupper():
                        constants[target.id] = self._extract_value(node.value)
        return constants

    def _extract_value(self, node):
        if isinstance(node, ast.Constant):
            return node.value
        elif isinstance(node, ast.List):
            return [self._extract_value(elt) for elt in node.elts]
        elif isinstance(node, ast.Dict):
            return {self._extract_value(k): self._extract_value(v)
                   for k, v in zip(node.keys, node.values)}
        return "complex_value"

    def _extract_classes(self) -> Dict[str, ClassStructure]:
        classes = {}
        for node in self.tree.body:
            if isinstance(node, ast.ClassDef):
                methods = []
                attributes = {}
                dependencies = set()

                # Get parent classes
                parent_classes = [base.id for base in node.bases
                                if isinstance(base, ast.Name)]

                for item in node.body:
                    if isinstance(item, ast.FunctionDef):
                        methods.append(item.name)
                    elif isinstance(item, ast.Assign):
                        for target in item.targets:
                            if isinstance(target, ast.Name):
                                attributes[target.id] = self._get_type_hint(item)

                # Extract class dependencies
                for child in ast.walk(node):
                    if isinstance(child, ast.Name):
                        dependencies.add(child.id)

                classes[node.name] = ClassStructure(
                    name=node.name,
                    methods=methods,
                    attributes=attributes,
                    dependencies=dependencies - {node.name},
                    parent_classes=parent_classes
                )
        return classes

    def _get_type_hint(self, node):
        if hasattr(node, 'annotation'):
            return ast.unparse(node.annotation)
        return "unknown"

    def _extract_main_functions(self) -> List[str]:
        return [node.name for node in self.tree.body
                if isinstance(node, ast.FunctionDef)]

    def generate_summary(self) -> str:
        """Generate a human-readable summary of the codebase structure"""
        structure = self.analyze()

        summary = []
        summary.append("# Codebase Structure Summary")

        summary.append("\n## Core Dependencies")
        for imp in sorted(structure.imports):
            summary.append(f"- {imp}")

        summary.append("\n## Main Classes")
        for class_name, class_info in structure.classes.items():
            summary.append(f"\n### {class_name}")
            if class_info.parent_classes:
                summary.append(f"Inherits from: {', '.join(class_info.parent_classes)}")
            summary.append("Key methods:")
            for method in class_info.methods:
                summary.append(f"- {method}")

        summary.append("\n## Global Constants")
        for const, value in structure.constants.items():
            summary.append(f"- {const}")

        summary.append("\n## Main Functions")
        for func in structure.main_functions:
            summary.append(f"- {func}")

        return "\n".join(summary)

# Usage example:
if __name__ == "__main__":
    with open("core.py", "r") as f:
        code = f.read()

    analyzer = CodebaseAnalyzer(code)
    print(analyzer.generate_summary())
