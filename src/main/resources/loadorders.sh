while IFS= read -r line; do
curl -H "Content-Type: application/json" -X PUT --data-binary "$line" http://localhost:8080/transportationorders;
done < orders.json


Get-Content -Path "orders.json" | ForEach-Object {
    Invoke-RestMethod -Uri "http://localhost:8080/transportationorders" -Method Put -Body $_ -ContentType "application/json"
}