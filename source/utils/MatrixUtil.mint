/* Matrix Utilities - Translated from uxcore-matrix util.js */
module MatrixUtil {
  /*
  *
   * Generate array from start with given length
   * (1, 3) => [1, 2, 3]
   * (0, 2) => [0, 1]
  */
  fun makeArray (start : Number, length : Number) : Array(Number) {
    Array.range(start, start + length)
  }

  /*
  *
   * Get subtotal of heights/widths
   * Supports both array and single number
  */
  fun getSubTotal (sizes : Array(Number), start : Number, end : Number) : Number {
    Array.range(0, end - start)
    |> Array.reduce(0,
      (total : Number, i : Number) : Number {
        sizes[start + i]
        |> Maybe.withDefault(
          sizes[0]
          |> Maybe.withDefault(50))
        |> (value : Number) : Number { total + value }
      })
  }

  /*
  *
   * Get the largest array from a 2d array
  */
  fun getLargestArr (arr : Array(Array(Number))) : Array(Number) {
    arr
    |> Array.reduce([],
      (largest : Array(Number), item : Array(Number)) : Array(Number) {
        if Array.size(item) > Array.size(largest) {
          item
        } else {
          largest
        }
      })
  }

  /*
  *
   * Generate a virtual matrix used to generate real matrix with conflict detect
   * Returns VirtualMatrix with numData and vm, or error message if conflict detected
  */
  fun generateVM (data : Array(MatrixCell)) : VirtualMatrix {
    `
    (() => {
      const vm = [];
      const numData = #{encode data};

      // Conflict detect
      for (let i = 0; i < numData.length; i += 1) {
        const cell = numData[i];
        const indexArr = [];
        for (let k = 0; k < cell.col; k += 1) {
          indexArr.push(cell.x + k);
        }

        for (let j = 0; j < indexArr.length; j += 1) {
          const index = indexArr[j];
          if (!vm[index]) {
            vm[index] = [];
          }
          for (let m = 0; m < cell.row; m += 1) {
            if (vm[index][m + cell.y]) {
              return {
                numData: numData,
                vm: [],
                error: "Conflict detect: cell at x:" + cell.x + " y:" + cell.y
              };
            }
            vm[index][m + cell.y] = 1;
          }
        }
      }

      return {
        numData: numData,
        vm: vm,
        error: ""
      };
    })()
    `
    |> decode as VirtualMatrix
  }
}
