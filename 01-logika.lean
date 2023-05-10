example : p ∧ q ↔ q ∧ p :=
  sorry

example : p ∨ q ↔ q ∨ p :=
  sorry

example : (p ∧ q) ∧ r ↔ p ∧ (q ∧ r) :=
  sorry
  
example : (p ∨ q) ∨ r ↔ p ∨ (q ∨ r) :=
  sorry

example : p ∧ (q ∨ r) ↔ (p ∧ q) ∨ (p ∧ r) :=
  sorry
  
example : p ∨ (q ∧ r) ↔ (p ∨ q) ∧ (p ∨ r) :=
  sorry

example : (p → (q → r)) ↔ (p ∧ q → r) :=
  sorry

example : ((p ∨ q) → r) ↔ (p → r) ∧ (q → r) :=
  sorry

-- Demorganovi zakoni
example : ¬(p ∨ q) ↔ ¬p ∧ ¬q :=
  sorry

example : ¬p ∨ ¬q → ¬(p ∧ q) :=
  sorry

example : ¬(p ∧ ¬p) :=
  sorry

example : p ∧ ¬q → ¬(p → q) :=
  sorry

example : ¬p → (p → q) :=
  sorry

example : (¬p ∨ q) → (p → q) :=
  sorry

example : p ∨ False ↔ p :=
  sorry

example : p ∧ False ↔ False :=
  sorry

example : (p → q) → (¬q → ¬p) :=
  sorry

open Classical

theorem dne {p : Prop} (h : ¬¬p) : p :=
  sorry

theorem imp_or {p q : Prop} (h : p → q) : ¬p ∨ q :=
  sorry

theorem or_imp {p q : Prop} (h : ¬p ∨ q) : p → q :=
  sorry

variable (p q r s : Prop)

example : (p → r ∨ s) → ((p → r) ∨ (p → s)) :=
  sorry

example : ¬(p ∧ q) → ¬p ∨ ¬q :=
  sorry

example : ¬(p → q) → p ∧ ¬q :=
  sorry

example : (p → q) → (¬p ∨ q) :=
  sorry

example : (¬q → ¬p) → (p → q) :=
  sorry

example : p ∨ ¬p :=
  sorry

example : (((p → q) → p) → p) :=
  sorry
