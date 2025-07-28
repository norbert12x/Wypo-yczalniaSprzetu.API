using AutoMapper;
using WypozyczalniaSprzetu.API.Models;
using WypozyczalniaSprzetu.API.DTOs;
using WypozyczalniaSprzetu.API.Controllers;

namespace WypozyczalniaSprzetu.API.Profiles
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<Klient, LoginDto>();
            CreateMap<Rezerwacja, RezerwacjaReadDto>();
            CreateMap<Zwrot, ZwrotReadDto>();
            CreateMap<Klient, KlientReadDto>();
            CreateMap<Sprzet, SprzetReadDto>();
            CreateMap<Rezerwacja, RezerwacjaReadDto>();
            CreateMap<Zwrot, ZwrotReadDto>();
        }
    }
}
