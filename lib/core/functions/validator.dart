String? validator(String? value) {
  if (value?.isEmpty ?? true) {
    return 'Field is required';
  }
  return null;
}

String? validatorMultiSelect(List<dynamic>? value) {
  if (value?.isEmpty ?? true) {
    return 'Field is required';
  }
  return null;
}
