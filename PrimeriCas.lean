import Std.Tactic.SimpTrace
import Mathlib.Tactic.LibrarySearch

#check Or.elim
#check Or.inl
#check And.left

#print Or

theorem and_dist_or {p q r : Prop} :
    p ∧ (q ∨ r) ↔ (p ∧ q) ∨ (p ∧ r) :=
  have ltr : p ∧ (q ∨ r) → (p ∧ q) ∨ (p ∧ r) :=
    λ h : p ∧ (q ∨ r) =>
      have hp : p := And.left h
      have hqr : q ∨ r := And.right h
      Or.elim hqr
        (fun hq : q => Or.inl (And.intro hp hq))
        (fun hr : r => Or.inr (And.intro hp hr))
  have rtl : (p ∧ q) ∨ (p ∧ r) → p ∧ (q ∨ r) :=
    λ h : (p ∧ q) ∨ (p ∧ r) =>
      Or.elim h
        (λ hpq : p ∧ q =>
          And.intro
            (And.left hpq)
            (Or.inl (And.right hpq)))
        (λ hpr : p ∧ r =>
          And.intro
            (And.left hpr)
            (Or.inr (And.right hpr)))
  Iff.intro ltr rtl

theorem and_dist_or_2 {p q r : Prop} :
    p ∧ (q ∨ r) ↔ (p ∧ q) ∨ (p ∧ r) :=
  Iff.intro
    (λ h =>
      Or.elim h.right
        (fun hq : q => Or.inl ⟨h.left, hq⟩)
        (fun hr : r => Or.inr ⟨h.left, hr⟩))
    (λ h =>
      Or.elim h
        (λ hpq => ⟨hpq.left, (Or.inl hpq.right)⟩)
        (λ hpr => ⟨hpr.left,  (Or.inr hpr.right)⟩))

theorem and_dist_or_3 {p q r : Prop} :
    p ∧ (q ∨ r) ↔ (p ∧ q) ∨ (p ∧ r) := by
  apply Iff.intro
  . intro h
    have hp := h.left
    cases h.right with
    | inl hq => exact Or.inl (And.intro hp hq)
    | inr hr => exact Or.inr (And.intro hp hr)
  . intro h
    cases h with
    | inl hpq =>
      have hp : p := hpq.left
      have hq : q := hpq.right
      have hqorr : q ∨ r := Or.inl hq
      exact And.intro hp hqorr
    | inr hpr =>
      have hp : p := hpr.left
      have hr : r := hpr.right
      have hqorr : q ∨ r := Or.inr hr
      exact And.intro hp hqorr

-- Jednakost

#print Nat

#print Eq

example : 2 + 2 = 4 := by
  rfl

#check Nat.add_assoc
#check Nat.add_mul
#check Nat.add_comm

#check Nat.zero_add
#check Nat.add_zero

#check Nat.add_succ
#check Nat.succ_add

example {a b : Nat} : a + b = b + a := by
  induction a with
  | zero => rw [Nat.zero_add, Nat.add_zero]
  | succ k ih => rw [Nat.add_succ, ←ih, Nat.succ_add]

--------------------------------------------------------------------------------

def sum_first_n : Nat → Nat
| 0 => 0
| Nat.succ k => (Nat.succ k) + sum_first_n k

theorem mul_dvd {n k : Nat} : k ≥ 1 → n = n * k / k := by
  sorry

theorem gauss {n : Nat} : sum_first_n n = n * (n + 1) / 2 := by
  induction n with
  | zero => rfl
  | succ k ih =>
    unfold sum_first_n
    rw [ih]
    -- conv =>
    --   lhs
    --   lhs
    --   rw [@mul_dvd (Nat.succ k)]

    -- rw [@mul_dvd k]
    sorry

#check Nat.mul_add
#check Nat.right_distrib

theorem gauss2 {n : Nat} : 2 * sum_first_n n = n * (n + 1) := by
  induction n with
  | zero => rfl
  | succ k ih =>
    unfold sum_first_n
    rw [Nat.mul_add]
    rw [ih]
    rw [←Nat.right_distrib]
    rw [Nat.mul_comm]
    rw [Nat.add_comm]

theorem gauss2_5 {n : Nat} : 2 * sum_first_n n = n * (n + 1) := by
  induction n with
  | zero => rfl
  | succ k ih =>
    calc
      2 * sum_first_n (Nat.succ k) = 2 * ((Nat.succ k) + sum_first_n k)     := by rw [sum_first_n]
                                 _ = 2 * (Nat.succ k) + 2 * (sum_first_n k) := by rw [Nat.mul_add]
                                 _ = 2 * (Nat.succ k) + k * (k + 1)         := by rw [ih]
                                 _ = (2 + k) * (k + 1)                      := by rw [Nat.right_distrib]
                                 _ = (k + 1) * (2 + k)                      := by rw [Nat.mul_comm]
                                 _ = (k + 1) * (k + 2)                      := by simp only [Nat.add_comm]