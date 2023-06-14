require("code_runner").setup {
  term = {
    -- position = "belowright",
    position = "bot",
    size = 8,
  },
  float = {
    border = "single",
    height = 0.8,
    width = 0.8,
    x = 0.5,
    y = 0.5,

    -- Highlight group for floating window/border (see ':h winhl')
    border_hl = "FloatBorder",
    float_hl = "Normal",

    -- Transparency (see ':h winblend')
    blend = 20,
  },
  filetype = {
    python = "python3 -u",
    c =
    "cd $dir && gcc -Wall -lpthread -fno-omit-frame-pointer -pg -g -lm $fileName -o $fileNameWithoutExt.out  && $dir/$fileNameWithoutExt.out",
    cpp = "cd $dir && g++ -std=c++11 -lpthread -g $fileName -o $fileNameWithoutExt.out  && $dir/$fileNameWithoutExt.out",
    sh = "cd $dir && bash $fileName",
    html = "cd $dir && firefox $fileName",
    rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
    r = "Rscript $file",
    lua = "lua $file",
    nix = "nix eval -f $file",
    go = "cd $dir && go run $fileName",
    javascript = "cd $dir && node $fileName",
    java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
    typescript = "cd $dir && deno run $fileName",
  },
}
