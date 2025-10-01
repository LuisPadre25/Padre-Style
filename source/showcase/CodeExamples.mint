/* Code Examples as a Module */
module CodeExamples {
  const MINT_EXAMPLE = "component Counter {\n  property initial : Number = 0\n  state count : Number = initial\n\n  fun increment : Promise(Void) {\n    next { count: count + 1 }\n  }\n\n  fun render : Html {\n    <div>\n      <button onClick={increment}>\n        \"Count: \\#{Number.toString(count)}\"\n      </button>\n    </div>\n  }\n}"

  const JAVASCRIPT_EXAMPLE = "const fetchUser = async (id) => {\n  try {\n    const response = await fetch('/api/users/' + id);\n    const data = await response.json();\n    return data;\n  } catch (error) {\n    console.error('Error fetching user:', error);\n    throw error;\n  }\n};\n\n// Usage\nconst user = await fetchUser(123);"

  const TYPESCRIPT_EXAMPLE = "interface User {\n  id: number;\n  name: string;\n  email: string;\n  role: 'admin' | 'user';\n}\n\nclass UserService {\n  private users: User[] = [];\n\n  async getUser(id: number): Promise<User | null> {\n    return this.users.find(u => u.id === id) ?? null;\n  }\n\n  addUser(user: User): void {\n    this.users.push(user);\n  }\n}"

  const PYTHON_EXAMPLE = "def fibonacci(n: int) -> list[int]:\n  \"\"\"Generate Fibonacci sequence up to n terms.\"\"\"\n  if n <= 0:\n    return []\n  elif n == 1:\n    return [0]\n\n  sequence = [0, 1]\n  for i in range(2, n):\n    sequence.append(sequence[i-1] + sequence[i-2])\n\n  return sequence\n\n# Usage\nresult = fibonacci(10)\nprint('Fibonacci:', result)"

  const GO_EXAMPLE = "package main\n\nimport \"fmt\"\n\ntype Person struct {\n  Name string\n  Age  int\n}\n\nfunc (p *Person) Greet() string {\n  return fmt.Sprintf(\"Hello, I'm %s and I'm %d years old\", p.Name, p.Age)\n}\n\nfunc main() {\n  person := Person{Name: \"John\", Age: 30}\n  fmt.Println(person.Greet())\n}"
}
