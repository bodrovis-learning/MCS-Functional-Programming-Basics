# Написать макрос unless, работающий следующим образом:
MyModule.unless 1 + 1 == 2 do
  1 + 2
else
  3 + 4
end

# Подсказки: операции из do и else можно получать с помощью Keyword.get:
true_clause = Keyword.get clauses, :do, nil
false_clause = Keyword.get clauses, :else, nil

# Не забывайте о трюке:
!!condition
