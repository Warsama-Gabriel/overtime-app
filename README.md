##Overtime App

Key requirement: company needs documentation that salaried employees did or did not get overtime each week

## Models:
-- x Post -> date:date rationale:text
-- x User -> Devise
-- x AdminUser -> STI

## Features:
- Approval workflow
- SMS sending -> Link to approval or overtime input
- Administrate admin dashboard
- Block non admin and guest users
- Email summary to managers for approval.
- Need documentation on overtime for audits.

## UI:
- x Bootstrap -> Formatting
- Icons from font awesome
- x Update the styles for forms


## Refactor TODOS:
- Refactor user association integration test in post spec
- Refactor form posts for admin users with status
- Fix post_spec.rb:72
- Refactor post spec to use correct Factory girl reference

# DEV
Username: testmail@mail.com
password: asdfasdf

Adminuser: adminuser@mail.com
password: adminuser
