# Validation Strategy

## 1. Structural

- Required columns exist
- Keys are present
- Reference keys are unique

## 2. Data Quality

- Duplicate employee IDs
- Missing mandatory attributes
- Invalid dates

## 3. Referential Integrity

- Organisation references resolve
- Location references resolve
- Manager references resolve
- Position ownership resolves

## 4. Reconciliation

Compare independent sources and classify each record as Match, Mismatch or Missing.

## 5. Sign-off

High-risk exceptions must be resolved or formally accepted before migration approval.
