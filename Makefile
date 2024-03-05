.PHONY: all
all: web

.PHONY: build
build:
	julia --project=@. -e 'using Pkg; Pkg.instantiate()'

.PHONY: web
web:
	julia --project=docs -e 'using Pkg; Pkg.develop(PackageSpec(path=pwd())); Pkg.instantiate(); \
		include("docs/make.jl"); \
		using LiveServer; servedocs(); \
		'
.PHONY: docs
docs: web

.PHONY: test
test:
	julia -e 'using Pkg; Pkg.activate("."); Pkg.test()'

.PHONY: clean
clean:
	-rm -f  Manifest.toml docs/Manifest.toml
	-rm -rf docs/build
	-rm -rf Juisee_HW_v0.0.6 Juisee_HW_v0.0.6.zip
	-rm -rf tools/fonts/Juisee_HW_v0.0.6 tools/fonts/Juisee_HW_v0.0.6.zip