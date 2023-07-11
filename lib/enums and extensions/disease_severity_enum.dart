enum DiseaseSeverity {
  low,
  medium,
  high,
}

extension DiseaseSeverityToString on DiseaseSeverity {
  String inDetail() {
    switch (this) {
      case DiseaseSeverity.low:
        return 'Low Risk, easily curable by medicine';
      case DiseaseSeverity.medium:
        return 'Moderate Risk, so take proper precautions';
      case DiseaseSeverity.high:
        return 'Highly risky disease, only cured by proper treatment';
    }
  }

  String toStr() {
    switch (this) {
      case DiseaseSeverity.low:
        return 'Low Risk Disease';
      case DiseaseSeverity.medium:
        return 'Moderate Risk Disease';
      case DiseaseSeverity.high:
        return 'High Risk Disease';
    }
  }
}
