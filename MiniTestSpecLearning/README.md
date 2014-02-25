Learning Repo for MiniSpec && MiniTest

# Testing Guidelines (by Sandi Metz)

## Rules of testing

- Test incoming query messages by making assertions about what they send back. Test only the interface, not the implementation (do not look inside the capsule)
- Test incoming command messages by making assertions about direct public side effects.
- Do not test private methods, do not make assertions about their result, do not expect to send them
- Do not test outgoing query messages
- Expect to send outgoing command messages
- Rule 3 can be broken if you deal with a complex private algorithm that you need to TDD. The tests have value early on, but as time passes they prevent people from refactoring/improving your code. So just delete them.
- Rule 5 can be broken if side effects are stable and cheap (close, not far away).
