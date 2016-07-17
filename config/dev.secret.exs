use Mix.Config

config :guardian, Guardian,
  issuer: 	      "SessionService",
  secret_key:      
    %{
      "crv" => "P-521",
      "d"   => "Aco1UC9BX4EpnjXO_BWCmddqKsX05qk68KwYS4HtcS_UfsQnmWFQJ2n-peZ6FgeN4eCNVsvbYIRu2rfz9rFY6Dx5",
      "kty" => "EC",
      "x"   => "AK2yL0HySJ2Zv4fJWJKo1rSjS03Ra9AElVcB-aYh4RUVYhr9snWZJM1xIrSDljkvw4iGVYlrXagVCjNfMcp70fSX",
      "y"   => "AfzjzKNM-CtN3kK2FShj8mjEnD1sto9H4HoPwD6efupFa43YsOKrmspkA97UWj56CrItpz5SaX8CEQozkQrHkGn9" },
  serializer:     SessionService.GuardianSerializer,
  ttl:            { 30, :days } 

config :session_service, SessionService.Repo,
  username: "strike",
  password: "mfuntime"
