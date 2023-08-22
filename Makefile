.DEFAULT_GOAL := gen

gen:
	@echo "╠ -------------------------- START -----------------------------"
	@echo "╠ ---------------------- Create files --------------------------"
	fvm flutter packages pub run build_runner build
	fvm flutter pub run easy_localization:generate -S assets/translations -f keys -o app_strings.g.dart
	@echo "╠ -------------------------- FINISH ----------------------------"

gen-force:
	@echo "╠ ------------------------- START ------------------------------"
	@echo "╠ ------------------- Force-Create files -----------------------"
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs
	fvm flutter pub run easy_localization:generate -S assets/translations -f keys -o app_strings.g.dart
	@echo "╠ -------------------------- FINISH ----------------------------"

gen-lang:
	@echo "╠ ------------------------- START ------------------------------"
	@echo "╠ ------------------- Generate strings -------------------------"
	fvm flutter pub run easy_localization:generate -S assets/translations -f keys -o app_strings.g.dart
	@echo "╠ -------------------------- FINISH ----------------------------"

extract-translations:
	@echo "╠ ------------------------- START ------------------------------"
	@echo "╠ ------------------- Force-Create files -----------------------"
	fvm flutter pub run localization_key_gen:merge -s assets/translations/lang.csv -x assets/translations/temp.csv -o out/translations.csv
	@echo "╠ Output file: out/translations.csv"
	@echo "╠ -------------------------- FINISH ----------------------------"

bootstrap:
	@echo "╠ -------------------------- START -----------------------------"
	@echo "╠ ------------------------ Bootstrap ---------------------------"
	sh ./.scripts/bootstrap.sh -fv 3.13.0
	@echo "╠ -------------------------- FINISH ----------------------------"

clean:
	@echo "╠ -------------------------- START -----------------------------"
	@echo "╠ -------------------------- Clean -----------------------------"
	sh ./.scripts/clean.sh
	@echo "╠ -------------------------- FINISH ----------------------------"

deploy:
	@echo "╠ -------------------------- START -----------------------------"
	@echo "╠ ---------------- Deploy $(env): Preparing... -----------------"
	make gen-force
	@echo "╠ ------------------------ Deploy $(env) -----------------------"
	cd .ci && sh ./deploy.sh -s $(env)
	@echo "╠ -------------------------- FINISH ----------------------------"

test-cov:
	@echo "╠ -------------------------- START -----------------------------"
	@echo "╠ -------------------- Test with coverage. ---------------------"
	fvm flutter test --coverage ./lib
	lcov -e coverage/lcov.info 'lib/common/constant/*' 'lib/common/extension/*' 'lib/common/service/*' 'lib/common/util/*' '*_cubit.dart' -o coverage/lcov_cleaned.info
	genhtml coverage/lcov_cleaned.info --output=coverage
	@if [ "$(open)" = "true" ]; then open coverage/index.html; fi
	@echo "╠ -------------------------- FINISH ----------------------------"

add-feature:
	@echo "╠ -------------------------- START -----------------------------"
	@echo "╠ --------------------- Add feature $(name)---------------------"
	mason make feature --name $(name) -o ./lib/feature
	make gen
	@echo "╠ -------------------------- FINISH ----------------------------"

add-dto:
	@echo "╠ -------------------------- START -----------------------------"
	@echo "╠ ----------------------- Add dto $(name)-----------------------"
	mason make dto --name $(name) -o ./lib/common/network/dto
	make gen
	@echo "╠ -------------------------- FINISH ----------------------------"

add-api:
	@echo "╠ -------------------------- START -----------------------------"
	@echo "╠ ----------------------- Add api $(name)-----------------------"
	mason make api --name $(name) -o ./lib/common/network/api
	make gen
	@echo "╠ -------------------------- FINISH ----------------------------"