import std/[paths, macros, strutils]

let foo = "lol"

macro `case`(elem: Path): untyped =
  result = nnkIfStmt.newTree

  let selector = elem[0]
  for i in 1 ..< elem.len:
    let node = elem[i]
    case node.kind
    of nnkElse, nnkElseExpr, nnkElifBranch, nnkElifExpr:
      result.add node
    of nnkOfBranch:
      let cond = nnkInfix.newTree(newIdentNode "in", newLit "*", node)
      let body = 
    else:
      error "custom 'case' for Path cannot handle this node", node

dumpAstGen:
