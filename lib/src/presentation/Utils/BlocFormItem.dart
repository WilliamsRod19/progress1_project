class BlocFormItem {
  final String value;
  final String? error;

  const BlocFormItem({
    this.value = '',
    this.error,
  });

  //Crear metodo que me ayude a modificar estos valores
  BlocFormItem copyWith({
    String? value,
    String? error,
  }) {
    return BlocFormItem(
      value: value ?? this.value,
      error: error ?? this.error,
    );
  }
}