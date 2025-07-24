// File: Profiles/MappingProfile.cs
using AutoMapper;
using WypozyczalniaSprzetu.API.Models;
using WypozyczalniaSprzetu.API.DTOs;

namespace WypozyczalniaSprzetu.API.Profiles
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<Rezerwacja, RezerwacjaReadDto>();
            CreateMap<Zwrot, ZwrotReadDto>();
            CreateMap<Klient, KlientReadDto>();
            CreateMap<Sprzet, SprzetReadDto>();
            // Dodaj inne mapowania, jeśli potrzebujesz
        }
    }
}
